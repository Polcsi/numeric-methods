int n = 10;
float a = 1;
float b = 2;
float h = (b - a) / (n - 1);
float t0 = 0;
float y0 = 1;
float[] y = new float[(int)n];
float[] t = new float[(int)n];
Func<float, float, float> f = delegate (float x, float w) { return x + w; };

for (int i = 0; i < n; i++)
{
    t[i] = t0 + h * (i + 1);
    if (i == 0)
    {
        y[i] = y0 + h * f(t0, y0);
        Console.WriteLine($"step: {i}\tt: {t[i]}\tw: {y[i]}");
    }
    else
    {
        y[i] = y[i - 1] + h * f(t[i - 1], y[i - 1]);
        Console.WriteLine($"step: {i}\tt: {t[i]}\tw: {y[i]}");
    }
}