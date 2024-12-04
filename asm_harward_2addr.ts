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

convolutionEmulator.loadData([...arr1, ...arr2, 0, 0, 0, 0, 0, 0, 0, 0, 0]);

const instructions = [];
const arr1Length = arr1.length;
const arr2Length = arr2.length;
const resultStartIndex = arr1Length + arr2Length;

for (let shift = 0; shift < arr1Length + arr2Length - 1; shift++) {
  instructions.push("RESET ACC");
  for (let i = 0; i < arr1Length; i++) {
    const j = shift - i; // Сдвиг
    if (j >= 0 && j < arr2Length) {
      instructions.push(`LOAD R1 ${i}`);
      instructions.push(`LOAD R2 ${arr1Length + j}`);
      instructions.push(`MUL R1 R2`);
      instructions.push(`ADD ACC R1`);
    }
  }
  instructions.push(`STORE ACC ${resultStartIndex + shift}`);
}

convolutionEmulator.loadInstructions(instructions);
convolutionEmulator.execute();

const result = convolutionEmulator
  .getData()
  .slice(resultStartIndex, resultStartIndex + arr1Length + arr2Length - 1);

console.log("Полная свёртка:", result);


// function convolve(arr1: number[], arr2: number[]): number[] {
//   const n1 = arr1.length;
//   const n2 = arr2.length;
//   const resultLength = n1 + n2 - 1; // Длина результирующего массива
//   const result = new Array(resultLength).fill(0);

//   for (let i = 0; i < resultLength; i++) {
//     for (let j = 0; j < n1; j++) {
//       const k = i - j;
//       if (k >= 0 && k < n2) { // Проверяем, что индекс k в пределах второго массива
//         result[i] += arr1[j] * arr2[k];
//       }
//     }
//   }
//   return result;
// }

// const result1 = convolve(arr1, arr2);
// console.log("Результат свёртки:", result1);
