using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ThreePoints
{
    public partial class Form1 : Form
    {
        private Random random = new Random();

        public Form1()
        {
            InitializeComponent();
            panel1.Paint += new PaintEventHandler(panel1_Paint);
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {
            Graphics graphics = e.Graphics;
            Pen pen = new Pen(Color.Red);

            // Генерация случайных точек
            Point[] points = GenerateRandomPoints(3, panel1.Width, panel1.Height);

            // Рисование точек
            foreach (Point point in points)
            {
                graphics.DrawEllipse(pen, point.X - 2, point.Y - 2, 4, 4);
            }

            pen.Dispose();

            // Отображение сообщения с информацией о точках
            ShowPointInformation(points);
        }

        private Point[] GenerateRandomPoints(int count, int maxX, int maxY)
        {
            Point[] points = new Point[count];

            for (int i = 0; i < count; i++)
            {
                int x = random.Next(maxX);
                int y = random.Next(maxY);
                points[i] = new Point(x, y);
            }

            return points;
        }

        private void ShowPointInformation(Point[] points)
        {
            string message = "Количество точек: " + points.Length + Environment.NewLine;

            for (int i = 0; i < points.Length; i++)
            {
                message += "Точка " + (i + 1) + ": X = " + points[i].X + ", Y = " + points[i].Y + Environment.NewLine;
            }

            if (points.Length >= 2)
            {
                double distance = CalculateDistance(points[0], points[1]);
                message += "Расстояние между точками 1 и 2: " + distance.ToString("F2");
            }

            MessageBox.Show(message, "Информация о точках");
        }

        private double CalculateDistance(Point p1, Point p2)
        {
            int dx = p2.X - p1.X;
            int dy = p2.Y - p1.Y;
            return Math.Sqrt(dx * dx + dy * dy);
        }
    }
}