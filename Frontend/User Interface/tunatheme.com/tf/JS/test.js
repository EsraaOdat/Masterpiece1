
//sort 

function bubbleSort(arr) {
    let n = arr.length;
    for (let i = 0; i < n - 1; i++) {
        for (let j = i + 1; j < n; j++) {
            if (arr[i] > arr[j]) {
                // Swap elements
                [arr[i], arr[j]] = [arr[j], arr[i]];
            }
        }
    }
    return arr;
}

// Example usage
console.log(bubbleSort([64, 34, 25, 12, 22, 11, 90]));









function sortEvenOdd(arr) {
    let evenArray = []; // مصفوفة لتخزين الأعداد الزوجية
    let oddArray = []; // مصفوفة لتخزين الأعداد الفردية
  
    // حلقة للمرور عبر المصفوفة
    for (let i = 0; i < arr.length; i++) {
      if (arr[i] % 2 === 0) {
        evenArray.push(arr[i]); // إضافة العدد الزوجي
      } else {
        oddArray.push(arr[i]); // إضافة العدد الفردي
      }
    }
  
    let sortedArray = evenArray.concat(oddArray); // إرجاع الأعداد الزوجية أولاً ثم الفردية
  
    console.log("Even numbers:", evenArray);
    console.log("Odd numbers:", oddArray);
    console.log("Sorted array:", sortedArray);
    
    return sortedArray; // إرجاع الأعداد مرتبة
  }
  
  // مثال على الاستخدام
  sortEvenOdd([5, 3, 8, 6, 2, 7, 4, 1]);
  