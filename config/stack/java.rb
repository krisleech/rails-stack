package :java do
  description 'Java'

  apt 'openjdk-6-jre'

  verify do
    has_executable 'java'
  end
end

