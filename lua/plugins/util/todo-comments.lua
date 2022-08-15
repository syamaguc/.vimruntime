local status, todo_comment = pcall(require, "todo-comments")
if not status then
  return
end

todo_comment.setup()
