let n = 4;
let a = 0;
let b = 0.4;
let h = 0.1;
let t0 = 0;
let y0 = 1;
let f = (t, y) => 2 * t + y;
let t = new Array(n).fill(0);
let y = new Array(n).fill(0);
t[0] = t0;
y[0] = y0;

for (let i = 0; i < n; i++) {
  t[i + 1] = t0 + h * (i + 1);

  ye = y[i] + h * f(t[i], y[i]);
  y[i + 1] = y[i] + h * f(t[i + 1], ye);
}

t.forEach((el, index) => {
  console.log(el + "\t\t\t" + y[index]);
});
