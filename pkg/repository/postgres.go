package repository

import (
	"database/sql"
	"fmt"
	"github.com/jmoiron/sqlx"
)

type Config struct {
	Host string
	Port string
	Username string
	Password string
	DBName string
	SSLMode string
}

func NewPostgressDB(cfg Config) (*sql.DB, error) {
	db,err := sqlx.Open("postgres", fmt.Sprintf("host=%s port=%s user=%s password=%s dbname=%s sslmode=%s",))
		cfg.Host, cfg.Port, cfg.Username, cfg.Password, cfg.SSLMode))
	if err != nil {
		return nil, err
	}
	err = db.Ping()
	if err != nil {
		return nil, err
	}

	return db, nil
}