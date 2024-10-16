# Клас Facade забезпечує простий інтерфейс для складної логіки одного або
# кілька підсистем. Фасад делегує клієнтські запити
# відповідні об'єкти в підсистемі. Фасад також відповідає за
# управління їхнім життєвим циклом. Все це захищає клієнта від небажаного
# складність підсистеми.
class Facade
    # Залежно від потреб програми,можемо надати Facade з
   # існуючих об'єктів підсистеми або змусити Фасад створити їх самостійно.
    def initialize(subsystem1, subsystem2)
      @subsystem1 = subsystem1 || Subsystem1.new
      @subsystem2 = subsystem2 || Subsystem2.new
    end
  
    # Методи Facade — це зручні ярлики для витончених
   # функціональність підсистем. Однак клієнти отримують лише частину
   # можливості підсистеми.
    def operation
      results = []
      results.append('Facade initializes subsystems:')
      results.append(@subsystem1.operation1)
      results.append(@subsystem2.operation1)
      results.append('Facade orders subsystems to perform the action:')
      results.append(@subsystem1.operation_n)
      results.append(@subsystem2.operation_z)
      results.join("\n")
    end
  end
  
  # Підсистема може приймати запити як від фасаду, так і безпосередньо від клієнта.
  # У будь-якому випадку, для Підсистеми Фасад – це ще один клієнт, але це не так
  # частина Підсистеми.
  class Subsystem1
    def operation1
      'Subsystem1: Ready!'
    end
  
    def operation_n
      'Subsystem1: Go!'
    end
  end
  
  # Деякі фасади можуть працювати з кількома підсистемами одночасно.
  class Subsystem2

    def operation1
      'Subsystem2: Get ready!'
    end

    def operation_z
      'Subsystem2: Fire!'
    end
  end
  
  # Клієнтський код працює зі складними підсистемами через простий інтерфейс
  # надає Фасад. Коли фасад керує життєвим циклом підсистеми,
  # клієнт може навіть не знати про існування підсистеми. Це
  # підхід дозволяє тримати складність під контролем.
  def client_code(facade)
    print facade.operation
  end
  
  # У коді клієнта можуть бути вже створені деякі з об’єктів підсистеми. в
  # у цьому випадку варто було б ініціалізувати Facade цими об’єктами
  # замість того, щоб дозволяти Facade створювати нові екземпляри.
  subsystem1 = Subsystem1.new
  subsystem2 = Subsystem2.new
  facade = Facade.new(subsystem1, subsystem2)
  client_code(facade)