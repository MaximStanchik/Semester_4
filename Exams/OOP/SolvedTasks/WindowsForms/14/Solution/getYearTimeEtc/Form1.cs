using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace getYearTimeEtc
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            timer1.Enabled = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Text = "Год: " + DateTime.Now.Year.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Text = "День: " + DateTime.Now.Day.ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox1.Text = "Минуты: " + DateTime.Now.Minute.ToString();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            textBox1.Text = "Секунды: " + DateTime.Now.Second.ToString();
        }
        private void timer1_Tick_1(object sender, EventArgs e)
        {
            string CurrentDate = DateTime.Now.ToString();
            textBox2.Text = CurrentDate;
        }
    }
}
