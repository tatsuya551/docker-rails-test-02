json.name @comment.name
json.created_at @comment.created_at.to_s(:datetime_jp)
json.comment simple_format(@comment.comment)
json.id @comment.id

