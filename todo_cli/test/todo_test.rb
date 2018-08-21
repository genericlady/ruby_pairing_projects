require "minitest/autorun"
require_relative "../config/environment"

require_rel "../lib"

class TodoTest < Minitest::Test
  def setup
    Todo.delete_all
  end

  def test_list_items
    assert_equal Todo.all, []
  end

  def test_creating_todo_item
    attributes = { title: 'Title',
                   description: 'Great description',
                   due_at: "2018-08-20" }

    todo = Todo.create(attributes)

    assert_equal todo.title, 'Title'
    assert_equal todo.description, 'Great description'
    assert_equal todo.due_at, '2018-08-20'
    assert_equal todo.state, :pending
    assert_equal Todo.all.length, 1
  end

  def test_complete_todo
    attributes = { title: 'Title',
                   description: 'Great description',
                   due_at: "2018-08-20" }

    todo = Todo.create(attributes)

    assert_equal todo.completed?, false

    todo.complete!

    assert_equal todo.completed?, true
  end

end
