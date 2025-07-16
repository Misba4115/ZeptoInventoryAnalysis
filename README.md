## 🧮 Zepto Product Analytics — SQL Project**

This is my **FIRST SQL PROJECT**  where I explored, cleaned, and analyzed a retail product dataset inspired by **Zepto**, a fast-commerce delivery platform. 
The goal was to understand the data, clean inconsistencies, and answer real-world business questions using SQL.

**📂 Project Structure**
- zepto.sql: Contains SQL queries used for:
  - Table creation
  - Data exploration
  - Cleaning
  - Business insights and reporting

**🗃️ Table Schema**

| Column                | Data Type         
|-----------------------|------------------
| sku_id                | SERIAL PRIMARY KEY
| category              | VARCHAR(120)     
| name                  | VARCHAR(150)     
| mrp                   | NUMERIC(8,2)     
| discountPercent       | NUMERIC(5,2)     
| availableQuantity     | INTEGER          
| discountSellingPrice  | NUMERIC(8,2)   
| weightInGms           | INTEGER          
| outOfStock            | BOOLEAN          
| quantity              | INTEGER          


**📊 The project aimed to Answer the following questions**

 Q1  Top 10 best-value products based on discount 
 Q2  Products with high MRP but currently out of stock 
 Q3  Estimated revenue per product category 
 Q4  Products with MRP > ₹500 and discount < 10% 
 Q5  Top 5 categories offering the highest average discount 
 Q6  Price per gram for products ≥ 100g 
 Q7  Categorization of products based on weight (Low/Medium/Bulk) 
 Q8  Total inventory weight per category 

**💡 Learnings**

- How to write clean and modular SQL queries
- How to perform data cleaning using SQL
- Improved understanding of SQL aggregate functions, case statements, filtering, and sorting
