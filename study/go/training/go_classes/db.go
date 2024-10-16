package main
import (
	"database/sql"
	"fmt"
	_ "github.com/lib/pq"
)

const (
	host     = "localhost"
	port     = 5432
	user     = "postgres"
	password = "postgres"
	dbname   = "go_learning"
)

func selectQuery(db *sql.DB, table string, id int) (int, string) {
	var email string

	query := fmt.Sprintf(`SELECT id, email FROM %s WHERE id=$1;`, table)

	row := db.QueryRow(query, id)

	switch err := row.Scan(&id, &email); err {
		case sql.ErrNoRows:
			fmt.Println("No rows were returned!")
			return -1, ""

		case nil:
			return id, email

		default:
			fmt.Println(`Error: %s`, err.Error())
			// panic(err)
			return -1, ""
	}
}

func main() {
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)
	db, err := sql.Open("postgres", psqlInfo)
	if err != nil {
		panic(err)
	}
	defer db.Close()
	err = db.Ping()
	if err != nil {
		panic(err)
	}
	fmt.Println("Successfully connected!")
// 	sqlStatement := `
// INSERT INTO go_learning.students (first_name, last_name, email)
// VALUES ($1, $2, $3)`
	// _, err = db.Exec(sqlStatement, "Victor", "Cruz", "vctor@cruz.com")

	// if err != nil {
	// 	panic(err)
	// }

	id, email := selectQuery(db, "go_learning.students", 7)

	fmt.Printf("RESULT: id = %d and e-mail = %s\n", id, email)
}
