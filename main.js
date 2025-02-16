// 数値,演算子のボタンが押された時に表示する関数
function numClick(event) {
  let resultInput = document.getElementById("result");
  let inputtedValue = event.target.value; // 入力した値
  let currentValue = resultInput.value; // 現在入力されている値
  
    // 0が表示された状態で00や演算子を入力できない
  if (currentValue === "0" && (inputtedValue === "00" || /[+\-*/]/.test(inputtedValue))) {
    return;
  }

    // 0が表示された状態で小数点以外を入力できない
  if (currentValue === "0" && inputtedValue !== ".") {
    resultInput.value = inputtedValue;
    return;
  }
  
    // 直前に演算子が表示された状態で演算子を入力できない
  let lastChar = currentValue.slice(-1);
  if (/[+\-*/]/.test(lastChar) && /[+\-*/]/.test(inputtedValue)) {
    return;
  }
  
    resultInput.value += inputtedValue;
  }


// ACボタンが押された時に表示を0にする関数
function clearInput() {
  let resultInput = document.getElementById("result");
  resultInput.value = "0";
}


// 数式を読み込む関数
function computeExpression(expression) {
  let numbers = expression.split(/[\+\-\*\/]/).map(Number);
  let operators = expression.match(/[\+\-\*\/]/);
  
  // 演算子以外が押されたらそのまま返す
  if (!operators) return numbers[0];
  
  let result = numbers[0];
  for (let i = 0; i < operators.length; i++) {
    let nextNumber = numbers[i + 1];
    let operator = operators[i];
    if (operator === "+") result += nextNumber;
    if (operator === "-") result -= nextNumber;
    if (operator === "*") result *= nextNumber;
    if (operator === "/") result /= nextNumber;
  }
  
  return result;
}


// =が押された時に計算を行う関数
function calculate() {
  let resultInput = document.getElementById("result");
  let expression = resultInput.value;
  let result = computeExpression(expression);
  resultInput.value = result;
}