// OP1: insertMany()
db.products.insertMany([...]); 

// OP2: find() - Electronics price > 20000
db.products.find({ "category": "Electronics", "price": { $gt: 20000 } });

// OP3: find() - Groceries expiring before 2025
db.products.find({ "category": "Groceries", "attributes.expiry_date": { $lt: "2025-01-01" } });

// OP4: updateOne() - Add discount
db.products.updateOne({ "product_name": "Gaming Laptop Pro" }, { $set: { "discount_percent": 10 } });

// OP5: createIndex()
db.products.createIndex({ "category": 1 });
// Reason: Indexing the 'category' field improves query performance significantly 
// because it allows MongoDB to avoid a full collection scan when filtering 
// products by category (like in OP2 and OP3).