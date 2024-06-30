using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ControlPanel
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            string currentYear = DateTime.Now.Year.ToString();
            label1.Text = "Текущий год: " + currentYear;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string currentHours = DateTime.Now.Hour.ToString();
            label1.Text = "Текущие часы: " + currentHours;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string currentMinutes = DateTime.Now.Minute.ToString();
            label1.Text = "Текущие минуты: " + currentMinutes;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

    }
}
