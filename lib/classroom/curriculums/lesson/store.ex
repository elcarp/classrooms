defmodule Classroom.Curriculums.Lesson.Store do
  use Agent

  alias Classroom.Curriculums.Lesson

  def start_link(_) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def add(%Lesson{} = lesson) do
    Agent.update(__MODULE__, fn state -> [lesson | state] end)
  end

  def all do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def get(lesson_id) do
    Agent.get(__MODULE__, fn state -> 
      Enum.find(state, fn lesson -> 
        lesson.id == lesson_id 
      end)
    end)
  end
end