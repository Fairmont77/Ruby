class Machine
  attr_accessor :name, :downtime, :work_time

  def initialize(name, downtime, work_time)
    @name = name
    @downtime = downtime
    @work_time = work_time
  end

  def total_time
    downtime + work_time
  end

  def relative_downtime
    (downtime.to_f / total_time) * 100
  end
end

class Factory
  def initialize
    @machines = []
  end

  def add_machine(machine)
    @machines << machine
  end

  def total_downtime
    @machines.sum(&:downtime)
  end

  def machines_without_downtime
    @machines.select { |machine| machine.downtime == 0 }.map(&:name)
  end

  def relative_downtime_of_all_machines
    total_time = @machines.sum(&:total_time)
    @machines.map do |machine|
      [machine.name, (machine.downtime.to_f / total_time) * 100]
    end.to_h
  end

  def relative_downtime_per_machine
    @machines.map do |machine|
      [machine.name, machine.relative_downtime]
    end.to_h
  end
end

factory = Factory.new

# Adding more machines
factory.add_machine(Machine.new("BambuLab-1", 10, 150))
factory.add_machine(Machine.new("BambuLab-2", 0, 160))
factory.add_machine(Machine.new("BambuLab-3", 5, 140))
factory.add_machine(Machine.new("BambuLab-4", 3, 170))
factory.add_machine(Machine.new("BambuLab-5", 8, 190))
factory.add_machine(Machine.new("BambuLab-6", 4, 200))
factory.add_machine(Machine.new("BambuLab-7", 0, 180))
factory.add_machine(Machine.new("BambuLab-8", 6, 160))

puts "Total Downtime: #{factory.total_downtime} hours"
puts "Machines without Downtime: #{factory.machines_without_downtime.join(', ')}"
puts "Relative Downtime of All Machines:"
factory.relative_downtime_of_all_machines.each do |name, downtime|
  puts "#{name}: #{'%.2f' % downtime}%"
end
puts "Relative Downtime Per Machine:"
factory.relative_downtime_per_machine.each do |name, downtime|
  puts "#{name}: #{'%.2f' % downtime}%"
end
