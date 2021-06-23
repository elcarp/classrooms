defmodule Classroom.Curriculums.Instructor.Store do
  use Agent

  alias Classroom.Participants.Instructor

  def start_link(_) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def add(%Instructor{} = instructor) do
    Agent.update(__MODULE__, fn state -> [instructor | state] end)
  end

  def all do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def get(instructor_id) do
    Agent.get(__MODULE__, fn state -> 
      Enum.find(state, fn instructor -> 
        instructor.id == instructor_id 
      end)
    end)
  end
end