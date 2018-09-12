USER
- name
- email
- password
- password_digest (schema)
- has_secure_password (model)

has_many :projects
has_many :clients, through: :projects


CLIENT
- name
- location

- has_many :projects
- has_many :users, through: :projects


PROJECT (JOIN)
- name
- deadline
- status

- has_many :entries
- belongs_to :client (schema, model)
- belongs_to :user (schema, model)


ENTRY
- date
- time
- notes

- belongs_to :project (needs foreign key)
- has_many :tags



---
TAGS (NEED ANOTHER JOIN?)
- description

- has_many :entries, through: entry_tags
- has_many :entry_tags
