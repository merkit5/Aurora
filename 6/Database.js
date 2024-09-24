function dbInit() {
    var db = LocalStorage.openDatabaseSync("Note_DB", "", "Notes", 1000000);
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS note_table (name TEXT, price REAL)');
        });
    } catch (err) {
        console.log("Error creating table in database: " + err);
    };
}


function dbGetHandle() {
    try {
        var db = LocalStorage.openDatabaseSync("ShoppingList_DB", "", "Shopping List", 1000000);
    } catch (err) {
        console.log("Error opening database: " + err);
    }
    return db;
}

function dbInsert(name, price) {
    var db = dbGetHandle();
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO product_table VALUES(?, ?)', [name, price]);
    });
}

function dbDelete(name) {
    var db = dbGetHandle();
    db.transaction(function (tx) {
        tx.executeSql('DELETE FROM product_table WHERE name = ?', [name]);
    });
}

function dbReadAll() {
    var db = dbGetHandle();
    db.transaction(function (tx) {
        var results = tx.executeSql('SELECT rowid, name, price FROM product_table ORDER BY rowid DESC');
        for (var i = 0; i < results.rows.length; i++) {
            shoppingListModel.append({
                name: results.rows.item(i).name,
                price: results.rows.item(i).price
            });
        }
    });
}
