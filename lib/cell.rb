class Cell

  attr_reader :ref, :status

  def initialize(ref)
    @ref = ref
    @status = :available
  end

end
