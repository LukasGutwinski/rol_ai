content_file = Creek::Book.new Rails.root.join("db", "import_data", "ROL-Export.xlsx"), with_headers: true
content_sheet = content_file.sheets[0]
row_number = 7
content_sheet.rows.drop(5).each do |row|
    p "Gesetz / Verordnung: " + row["D#{row_number}"].to_s
    p "Article Title: " + row["E#{row_number}"].to_s
    p "Article Content: " + row["F#{row_number}"].to_s
    row_number += 1
end