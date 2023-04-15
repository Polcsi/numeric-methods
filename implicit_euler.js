let n = 10;
let a = 1;
let b = 2;
let h = (b - a) / (n - 1);
let t0 = 0;
let y0 = 1;
let f = (t, y) => t + y;
let t = new Array(n).fill(0);
let y = new Array(n).fill(0);

for (let i = 0; i < n; i++) {
  t[i] = t0 + h * (i + 1);
  if (i == 0) {
    y[i] = y0 + h * f(t0, y0);
  } else {
    y[i] = y[i - 1] + h * f(t[i], y[i]);
  }
  console.log(t[i] + "\t\t\t" + y[i]);
}
