defmodule Classroom.Curriculums.Lesson do
  @derive Jason.Encoder

  defstruct [:id, :topic, :start_time, :end_time, :room_id]

  def new(%{topic: topic, start_time: start_time, end_time: end_time}) do
    %__MODULE__{
      id: UUID.uuid4(),
      topic: topic,
      start_time: start_time,
      end_time: end_time
    }
  end 
end