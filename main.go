package main
 
import (
   "first_crud/db"
   "first_crud/router"
)
 
func main() {
   db.InitPostgresDB()
   router.InitRouter().Run()
}