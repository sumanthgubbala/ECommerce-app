package main

import (
	"database/sql"
	//"math/rand"
	"net/http"
	//"time"
	"fmt"
	"log"

	"github.com/go-sql-driver/mysql"
	_ "github.com/go-sql-driver/mysql"
	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

var db *sql.DB

func connectDB() *sql.DB {
	cfg := mysql.Config{
		User:                 "root",
		Passwd:               "root",
		Net:                  "tcp",
		Addr:                 "localhost:3306",
		DBName:               "ecommerce",
		AllowNativePasswords: true,
	}

	var err error
	db, err = sql.Open("mysql", cfg.FormatDSN())
	if err != nil {
		log.Fatal(err)
	}
	pingErr := db.Ping()
	if pingErr != nil {
		log.Fatal(pingErr)
	}
	fmt.Println("Connected!")
	return db

}

type User struct {
	ID       int    `json:"id"`
	Username string `json:"username"`
	Password string `json:"password"`
	Email    string `json:"email"`
}

// createUser handles the creation of a new user.
/* func createUser(c echo.Context) error {
	username := c.FormValue("username")
	password := c.FormValue("password")
	email := c.FormValue("email")

	// Open database connection
	db, err := sql.Open("mysql", "root:root@tcp(localhost:3306)/ecommerce")
	if err != nil {
		return err
	}
	defer db.Close()

	// Begin database transaction
	tx, err := db.Begin()
	if err != nil {
		return err
	}

	// Check if username already exists
	var count int
	err = tx.QueryRow("SELECT COUNT(*) FROM users WHERE username=?", username).Scan(&count)
	if err != nil {
		tx.Rollback()
		return err
	}
	if count > 0 {
		tx.Rollback()
		return c.JSON(http.StatusBadRequest, map[string]string{"message": "Username already exists"})
	}

 	// Insert new user
	_, err = tx.Exec("INSERT INTO users (username, password, email) VALUES (?, ?, ?)", username, password, email)
	if err != nil {
		tx.Rollback()
		return err
	}

	// Commit transaction
	err = tx.Commit()
	if err != nil {
		tx.Rollback()
		return err
	}

	return c.JSON(http.StatusCreated, map[string]string{"message": "User created successfully"})
}
*/
// login handles user login.
func login(c echo.Context) error {
	username := c.FormValue("username")
	password := c.FormValue("password")

	db, err := sql.Open("mysql", "root:root@tcp(localhost:3306)/ecommerce")
	if err != nil {
		return err
	}
	defer db.Close()

	var user User
	err = db.QueryRow("SELECT id, username, password FROM users WHERE username=? AND password=?", username, password).Scan(&user.ID, &user.Username, &user.Password)
	if err != nil {
		return c.JSON(http.StatusUnauthorized, map[string]string{"message": "Invalid username or password"})
	}

	return c.JSON(http.StatusOK, map[string]string{"message": "Login successful"})
}

/*func resetPassword(c echo.Context) error {
// forgotPassword handles the "forgot password" functionality.
username := c.FormValue("username")
newPassword := generateRandomPassword(8)

db, err := sql.Open("mysql", "root:root@tcp(localhost:3306)/cai")
if err != nil {
	return err
}
defer db.Close()

// Update the user's password in the database
_, err = db.Exec("UPDATE users SET password=? WHERE username=?", newPassword, username)
if err != nil {
	return err
}

// Send the new password to the user's email (not implemented in this example)

return c.JSON(http.StatusOK, map[string]string{"message": "Password reset successful. New password sent to email."})
}

func generateRandomPassword(length int) string {
	rand.Seed(time.Now().UnixNano())
	charset := "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	password := make([]byte, length)
	for i := range password {
		password[i] = charset[rand.Intn(len(charset))]
	}
	return string(password)
}*/

func main() {
	e := echo.New()

	// Add CORS middleware
	e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
		AllowOrigins: []string{"*"}, // Replace with your Flutter frontend URL
		AllowHeaders: []string{echo.HeaderOrigin, echo.HeaderContentType, echo.HeaderAccept},
	}))

	// Define API endpoints
	e.POST("/login", login)
	//e.POST("/createUser", createUser)
	//e.POST("/resetPassword", resetPassword)

	e.POST("/Createaccount", func(c echo.Context) error {
		db := connectDB()
		var data User
		if err := c.Bind(&data); err != nil {
			return err
		}
		fmt.Println(data)

		result, err := db.Exec("INSERT INTO users (username, password, email) VALUES (?, ?, ?)", data.Username, data.Password, data.Email)

		if err != nil {
			// Handle the error, e.g., log it or return it
			log.Println("Error inserting data into users table:", err)
			// Optionally, you can return the error to the caller
			return err
		}
		// If there's no error, you can continue
		rowsAffected, _ := result.RowsAffected()
		log.Printf("Inserted data into users table. Rows affected: %d\n", rowsAffected)

		return c.String(http.StatusOK, "Data inserted successfully")
	})

	// Start the server
	e.Logger.Fatal(e.Start(":8080"))
}
