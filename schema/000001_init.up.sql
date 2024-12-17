CREATE TABLE users
(
    id serial not null unique,
    name varchar(255) not null,
    username varchar(255) not null unique,
    password_hash varchar(255) not null
);

CREATE TABLE resume_lists
(
    id serial not null unique,
    title varchar(255) not null,
    description(255)
);

CREATE TABLE users_lists
(
    id serial not null unique,
    user_id int references users(id) on delete sascade not null,
    list_id int references resume_lists (id) on delete sascade not null,
);

CREATE TABLE resume_items
(
    id serial   not null  unique,
    title varchar(255) not null,
    description varchar(255),
    done boolean not null default false
);

CREATE TABLE lists_items
(
    id serial   not null unique,
    items_id int references resume_items(id) on delete cascade  not null,
    list_id int references resume_lists(id) on delete cascade not null
)