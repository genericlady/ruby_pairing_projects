class Todo
  @@all = []

  attr_accessor :title, :description, :due_at, :state

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @description = attributes.fetch(:description)
    @due_at = attributes.fetch(:due_at)
    @state = :pending
  end

  def self.create(attributes)
    todo = new(attributes)
    @@all << todo
    todo
  end

  def self.all
    @@all
  end

  def self.delete_all
    @@all = []
  end

  def start!
    self.state = :in_progress
  end

  def complete!
    self.state = :completed
  end

  def archive!
    self.state = :archived
  end

  def over_due!
    self.state = :overdue
  end

  def completed?
    self.state == :completed
  end

end

