
var containers = [33, 14, 18, 20, 45, 35, 16, 35, 1, 13, 18, 13, 50, 44, 48, 6, 24, 41, 30, 42];
var testContainers = [20, 15, 10, 5, 5];
var combos = [];

function fillContainers(used,available,target) {

  debugger
  var remaining = target - add(used);

  for (var i = 0; i < available.length; i++){

    var container = available[i];

    if(container <= remaining) {

      var combo = used.slice();
      combo.push(container);

      if (container == target) {
        combos.push(combo);
        return combo;

      } else {

        available.splice(i, 1);
        available.forEach(fillContainers(used,available,target));

      }

    }

  }

}

function add(used) {

  var sum = 0;

  for(var i = 0; i < used.length;i++){
    sum = used[i] + sum;
  }
  return sum;
}

function getCount(containers,target){

  var used = [];
  var combinations = fillContainers(used,containers,target);

  return combinations;
}

console.log(getCount(testContainers,25));
console.log(getCount(containers,150));

console.log(combos);
