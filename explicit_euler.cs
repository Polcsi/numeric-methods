int n = 4;
float a = 0;
float b = 0.4f;
float h = 0.1f;
float t0 = 0;
float y0 = 1;
float[] y = new float[(int)n + 1];
float[] t = new float[(int)n + 1];
Func<float, float, float> f = delegate (float x, float w) { return (2 * x) + w; };
y[0] = y0;
t[0] = t0;

Console.WriteLine($"step: 0\tt: {t0}\ty: {y0}");
for (int i = 0; i < n; i++)
{
    t[i + 1] = t0 + h * (i + 1);

    float ye = y[i] + h * f(t[i], y[i]);
    y[i + 1] = y[i] + h * f(t[i + 1], ye);
    Console.WriteLine($"step: {i + 1}\tt: {t[i + 1]}\ty: {y[i + 1]}");
}

Console.ReadKey();