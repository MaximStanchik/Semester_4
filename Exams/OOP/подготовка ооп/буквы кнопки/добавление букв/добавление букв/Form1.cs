using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using добавление_букв;

namespace добавление_букв
{
    public partial class Form1 : Form
    {
        private string allLetters = "ЯЧСМИТЬБЮФЫВАПРОЛДЖЭЙЦУКЕНГШЩЗХЪ";
        private int current = 0;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBox1.Text += allLetters[current++];
            current %= allLetters.Length;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (textBox1.TextLength > 0)
            {
                textBox1.Text = textBox1.Text.Substring(0, textBox1.TextLength - 1);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (textBox1.TextLength > 0)
            {
                textBox1.Text += textBox1.Text[textBox1.TextLength - 1];
            }
        }
    }
}