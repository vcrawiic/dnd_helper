# ТЗ бэкенду — dnd_helper v1

> Статус: черновик от 2026-08-24. Развивает существующий REST-бэкенд (Go) под новую продуктовую концепцию.

## 1. Контекст и смена концепции

Раньше приложение было «справочником по D&D». Новая концепция: **справочник перестаёт быть самоцелью и превращается в набор контекстных подсказок**, встроенных в рабочие инструменты:

- списки заклинаний при создании/редактировании листа персонажа;
- статблоки монстров и NPC для размещения на батл-мапе;
- конструктор класса для создания персонажа «не с нуля»;
- (возможно) ширма мастера.

### Навигация (5 табов)
1. **Справочник** — консолидированный экран (сейчас на публичном GraphQL `dnd5eapi`, мигрирует на свой `/api/reference` позже).
2. **Тейблтоп (VTT)** — батл-мапа, реалтайм в комнате.
3. **Кубы** — броски (уже есть).
4. **Листы персонажей** — CRUD листов (уже есть, промоутится в отдельный таб).
5. **Профиль** (уже есть).

Чат — **не отдельный таб**, а панель внутри комнаты/тейблтопа (он per-room).

### Ключевые решения для v1
- Тейблтоп: **полноценный VTT** в комнате (сцены, токены, позиции, инициатива, туман войны, реалтайм через WS).
- Чат: **да**, включая результаты бросков в ленту чата.
- Платформы: **iOS + Android + Desktop (macOS/Win/Linux) + Web**.
- Источник подсказок (заклинания, статблоки, данные классов): **свой бэкенд `/api/reference`** (наполняем SRD-данными).

---

## 2. Что уже есть (recap, не меняем)

- **Auth**: register/login (username и email), refresh. AT 15 мин, RT 30 дней.
- **Users**: `GET/PATCH /api/users/me`.
- **Characters**: CRUD + `hp`, `level-up`, `short-rest`, `long-rest`, `spend-resource`, `ability-scores/*`.
- **Dice**: `roll`, `roll/parse`, `roll/ability-scores`, `history`.
- **Rooms**: CRUD, `join`, `joined`, `leave`, `kick`, `members`, `events`, `:id/ws`.
- **Reference**: `search`, `:type`, `:type/all`, `:type/:slug`.
- **Ошибки**: `{ "error": "..." }`, коды 400/401/403/404/409/429/500. Rate limit 10 req/s/IP, burst 20.

---

## 3. Новые модули

### 3.1. Assets (файлы) — НОВОЕ, приоритет P0

Нужно для карт сцен, картинок токенов, портретов персонажей.

| Метод | Путь | Кто | Описание |
|---|---|---|---|
| POST | `/api/assets` | 🔒 | multipart-загрузка. Поля: `file`, `type` (`map`\|`token`\|`portrait`). → `{ id, url, type, width, height, size }` |
| GET | `/api/assets/:id` | 🔒 | метаданные / редирект на URL |
| DELETE | `/api/assets/:id` | 🔒 owner | удалить |

- Хранилище: S3-совместимое (предпочтительно) или локальный диск с отдачей по URL.
- Whitelist mime: `png`, `jpg/jpeg`, `webp`. Лимиты: map ≤ 15 MB, token/portrait ≤ 5 MB.
- Отдавать через CDN/served URL. Для приватных карт — рассмотреть signed URL.

### 3.2. Reference — наполнение SRD + эндпоинты для конструктора, приоритет P0

Существующие эндпоинты остаются. Нужно:

1. **Наполнить БД SRD-данными.** Рекомендуемый источник — датасет `5e-bits/5e-database` (данные под SRD/OGL, тот же, что стоит за `dnd5eapi.co`). Учесть лицензию SRD 5.1 (CC-BY-4.0) — указать атрибуцию.
2. **Расширить данные класса для конструктора персонажа:**

| Метод | Путь | Описание |
|---|---|---|
| GET | `/api/reference/class/:slug` | + `hit_die`, `saving_throws`, `proficiencies`, `subclasses[]`, `spellcasting`, `starting_equipment` |
| GET | `/api/reference/class/:slug/levels` | таблица прогрессии: уровень → фичи, proficiency bonus, cantrips/spells known, слоты, классовые ресурсы |
| GET | `/api/reference/subclass/:slug` | подкласс + фичи по уровням |
| GET | `/api/reference/spell?class=&level=&school=&limit=&offset=` | фильтруемый список заклинаний для пикеров |

Ответы JSONB-полей — как `Map<String, dynamic>` (как в характеристиках персонажа).

### 3.3. Tabletop / VTT — НОВОЕ, приоритеты P1–P4

Всё живёт внутри комнаты (`room_id`). Комната может иметь несколько **сцен**; одна активная.

#### Scene
Поля: `id, room_id, name, map_asset_id, grid {type: square|hex|none, size_px, offset_x, offset_y}, width, height, is_active, fog_enabled, created_at`.

| Метод | Путь | Кто | Событие WS |
|---|---|---|---|
| POST | `/api/rooms/:id/scenes` | GM | `scene.created` |
| GET | `/api/rooms/:id/scenes` | member | — |
| GET | `/api/scenes/:sceneId` | member | — |
| PUT | `/api/scenes/:sceneId` | GM | `scene.updated` |
| DELETE | `/api/scenes/:sceneId` | GM | `scene.deleted` |
| POST | `/api/scenes/:sceneId/activate` | GM | `scene.activated` |

#### Token
Поля: `id, scene_id, name, image_asset_id, x, y, size (1x1/2x2…), rotation, owner_user_id (null=NPC/GM), character_id (null), monster_ref_slug (null), current_hp, max_hp, ac, conditions[], is_hidden (виден только GM), layer`.

| Метод | Путь | Кто | Событие WS |
|---|---|---|---|
| POST | `/api/scenes/:sceneId/tokens` | GM (игрок — свой) | `token.added` |
| PATCH | `/api/tokens/:tokenId` | GM любой; игрок — только позицию своего | `token.updated` |
| DELETE | `/api/tokens/:tokenId` | GM или owner | `token.removed` |

- `is_hidden` токены и скрытые области **не отдаются** игрокам (фильтрация на сервере).

#### Initiative (трекер инициативы)
Часть сцены: `entries: [{token_id, name, initiative, is_current}], round`.

| Метод | Путь | Кто | Событие WS |
|---|---|---|---|
| GET | `/api/scenes/:sceneId/initiative` | member | — |
| POST | `/api/scenes/:sceneId/initiative` | GM | `initiative.set` |
| PATCH | `/api/scenes/:sceneId/initiative/next` | GM | `turn.changed` |

#### Fog of war
- v1: сеточный reveal-mask (битовая маска раскрытых ячеек) — проще полигонов.
- Поле сцены `revealed_cells` (или отдельная таблица).

| Метод | Путь | Кто | Событие WS |
|---|---|---|---|
| PATCH | `/api/scenes/:sceneId/fog` | GM | `fog.updated` |

- Игрокам отдаётся только раскрытое состояние.

#### Инструменты мастера (GM tools)
Помимо ядра (сцены/токены/инициатива/туман/статблоки монстров) в v1 добавляем дешёвые high-value инструменты:

| Инструмент | Бэк | Реализация |
|---|---|---|
| Пинг/указка | эфемерный WS `ping` | `{x, y, actor}`, без БД |
| Измерение расстояния | эфемерный WS `measure` | `{from:{x,y}, to:{x,y}, actor}` — видно всем в реалтайме |
| AoE-шаблоны (конус/круг/линия/куб) | эфемерный WS `template` (персист опц.) | `{shape, x, y, size, rotation, actor}` |
| Скрытый бросок GM (whisper) | поле у сообщения чата | `visibility: all\|gm\|user:<id>` |
| Приватные заметки | поле у сцены/токена | `gm_notes` (отдаётся только GM) |
| Фокус камеры всем (spotlight) | эфемерный WS `camera.focus` | `{x, y, zoom?}` — GM перелетает вид всех игроков в точку |

> Приближение/перемещение карты (pan/zoom) — чисто клиентская камера, у каждого свой независимый вид. Бэк не хранит и не рассылает её; исключение — опциональный `camera.focus` выше.

**Отложено на потом:** динамическое освещение/линия зрения, журнал и раздатки (handouts), музыка/эмбиенс, билдер энкаунтеров с расчётом CR. **Ширма мастера** — статичный клиентский экран поверх `/api/reference`, отдельного бэка не требует.

### 3.4. Chat — НОВОЕ, приоритет P3

Сообщения привязаны к комнате. Чат принимает не только текст и броски, но и **типизированные игровые события**: атаки, проверки, спасброски, применение заклинаний с расшифровкой.

Message: `id, room_id, author_user_id (null=system), type, visibility (all|gm|user:<id>), payload, created_at`.

`type` и форма `payload`:

| type | payload |
|---|---|
| `text` | `{ text }` |
| `roll` | `{ notation, total, rolls[], modifier }` |
| `attack` | `{ name, source_token_id, target_token_id?, attack: {d20, mod, total, crit}, damage: {total, type, breakdown[]} }` |
| `check` | `{ ability, skill?, d20, mod, proficient, total, dc?, success? }` |
| `save` | `{ ability, d20, mod, total, dc?, success? }` |
| `spell` | `{ name, level, slot_used, school, ref_slug, description, attack?, save?, damage? }` — `description` для расшифровки заклинания |
| `system` | `{ text }` (join/leave/turn) |

| Метод | Путь | Кто | Событие WS |
|---|---|---|---|
| POST | `/api/rooms/:id/chat` | member | `chat.message` |
| GET | `/api/rooms/:id/chat?before=&limit=` | member | — (cursor-пагинация) |
| POST | `/api/rooms/:id/roll` | member | `chat.message` (type=roll) |

**Кто считает математику.** Для v1 клиент формирует структурированный payload и постит его (`POST /api/rooms/:id/chat`), бэк валидирует, сохраняет и рассылает. Описания заклинаний клиент берёт из `/api/reference/spell/:slug`. Позже, для защиты от читерства, можно добавить авторитетные серверные эндпоинты, где математика считается на бэке из данных персонажа:
- `POST /api/rooms/:id/attack {character_id, attack_id, target_token_id?}`
- `POST /api/rooms/:id/cast {character_id, spell_slug, slot_level, target_token_id?}`
- `POST /api/rooms/:id/check {character_id, ability|skill, dc?}`

- Простой бросок: `POST /api/rooms/:id/roll {notation, visibility?}` → сохраняется в чат и рассылается по WS.

---

## 4. WebSocket — единый протокол на комнату

Подключение: `GET /api/rooms/:id/ws` (уже есть).

⚠️ **Важно для веба:** браузерный `WebSocket` не умеет ставить заголовок `Authorization`. Передавать `access_token` через **query-параметр** (`?token=`) или `Sec-WebSocket-Protocol`.

### Конверт (envelope)
```json
{ "type": "token.moved", "ts": 1690000000, "actor": 42, "data": { } }
```

### Server → client события
`scene.created|updated|deleted|activated`, `token.added|updated|removed`, `initiative.set`, `turn.changed`, `fog.updated`, `chat.message`, `member.joined|left|kicked`, `presence` (кто онлайн).

### Client → server (эфемерные, не персистятся, фанаут остальным)
- `token.dragging` — живое превью перетаскивания токена (высокая частота, не пишем в БД). Позволяет не бить REST на каждый пиксель и не упираться в rate limit.
- `ping` — указка «смотрите сюда» `{x, y}`.
- `measure` — линейка `{from, to}`, видна всем в реалтайме.
- `template` — превью AoE-шаблона `{shape, x, y, size, rotation}`.

### Модель прав
- **GM** (владелец комнаты): полный контроль сцен/токенов/тумана/инициативы, kick.
- **Игрок**: двигать свои токены (owner/линк на его персонажа), кидать кубы, чат, менять HP своего персонажа.
- **Reference**: публичное чтение.

---

## 5. Нефункциональные требования (платформы)

- **CORS**: разрешить web-origin(ы), credentials, WS upgrade.
- **WS-auth**: через query-param токен (для браузеров).
- **Пагинация**: cursor для чата/событий; существующий `limit/offset` для списков.
- **Rate limit**: текущие 10 req/s не подходят для перетаскивания токенов → используем эфемерный WS-канал `token.dragging` вместо REST.
- Отдача картинок через CDN/served URL; приватные карты — signed URL.

---

## 6. Рекомендуемый порядок поставки

Хотя v1 = полный VTT, собирать инкрементально (фронт подключается по мере готовности):

- **P0** — Assets (загрузка) + Reference SRD-seed и эндпоинты класса/заклинаний. Разблокирует листы персонажей и подсказки.
- **P1** — Scenes + Tokens CRUD + WS-фанаут (статичная карта + двигаемые токены).
- **P2** — Трекер инициативы + `turn.changed`.
- **P3** — Чат + броски-в-чат.
- **P4** — Туман войны.
