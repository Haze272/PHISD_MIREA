class HarvardArchitectureEmulator {
  private memoryData: number[];
  private memoryInstructions: string[];
  private registers: { [key: string]: number };

  constructor(memorySize: number) {
    this.memoryData = new Array(memorySize).fill(0);
    this.memoryInstructions = [];
    this.registers = { ACC: 0, R1: 0, R2: 0, TMP: 0 };
  }

  loadData(data: number[]) {
    this.memoryData = [...data];
  }


  loadInstructions(instructions: string[]) {
    this.memoryInstructions = [...instructions];
  }

  execute() {
    for (const instruction of this.memoryInstructions) {
      const [op, arg1, arg2] = instruction.split(" ");
      switch (op) {
        case "LOAD":
          this.registers[arg1] = this.memoryData[parseInt(arg2)];
          break;
        case "ADD":
          this.registers[arg1] += this.registers[arg2];
          break;
        case "MUL":
          this.registers[arg1] *= this.registers[arg2];
          break;
        case "STORE":
          this.memoryData[parseInt(arg2)] = this.registers[arg1];
          break;
        case "RESET":
          this.registers[arg1] = 0;
          break;
        default:
          throw new Error(`Неизвестная инструкция: ${op}`);
      }
    }
  }

  getData(): number[] {
    return [...this.memoryData];
  }

  getRegisterValue(register: string): number {
    return this.registers[register];
  }
}

// Задание 1: Сумма элементов массива
const sumEmulator = new HarvardArchitectureEmulator(10);
sumEmulator.loadData([1, 2, 3, 4, 5, 0, 0, 0, 0, 0]);
sumEmulator.loadInstructions([
  "RESET ACC",
  "LOAD R1 0",
  "ADD ACC R1",
  "LOAD R1 1",
  "ADD ACC R1",
  "LOAD R1 2",
  "ADD ACC R1",
  "LOAD R1 3",
  "ADD ACC R1",
  "LOAD R1 4",
  "ADD ACC R1",
  "STORE ACC 5"
]);
sumEmulator.execute();
console.log("Сумма массива:", sumEmulator.getData()[5]);

// Задание 2: Свертка двух массивов

const arr1 = [1, 2, 3, 4, 5];
const arr2 = [1, -1, 1, -1, 1];
const convolutionEmulator = new HarvardArchitectureEmulator(20);

convolutionEmulator.loadData([
  ...arr1,
  ...arr2,
  0, 0, 0, 0, 0,
]);
convolutionEmulator.loadInstructions([
  "LOAD R1 0", "LOAD R2 5", "MUL R1 R2", "ADD ACC R1", // Элемент 1
  "LOAD R1 1", "LOAD R2 6", "MUL R1 R2", "ADD ACC R1", // Элемент 2
  "LOAD R1 2", "LOAD R2 7", "MUL R1 R2", "ADD ACC R1", // Элемент 3
  "LOAD R1 3", "LOAD R2 8", "MUL R1 R2", "ADD ACC R1", // Элемент 4
  "LOAD R1 4", "LOAD R2 9", "MUL R1 R2", "ADD ACC R1", // Элемент 5
  "STORE ACC 10" // Сохранение результата в память
]);

convolutionEmulator.execute();
console.log("Свертка массива:", convolutionEmulator.getData()[10]);
