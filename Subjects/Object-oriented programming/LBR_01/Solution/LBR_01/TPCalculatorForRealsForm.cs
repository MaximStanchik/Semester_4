using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LBR_01
{
    public partial class TPCalculatorForRealsForm : Form
    {
        public double saveSum = 0;
        public double currentValue = 0;
        public bool rad = true;
        public bool sin = false;
        public bool cos = false;
        public bool tan = false;
        public bool cot = false;
        public bool cubeRoot = false;
        public bool squareRoot = false;
        public bool exponentiation = false;
        public double exponentiationValue = 0;

        TPCalculatorForReals calculator = new TPCalculatorForReals();

        public TPCalculatorForRealsForm()
        {
            InitializeComponent();
        }

        private void button24_Click(object sender, EventArgs e)
        {
            saveSum = currentValue;
        }

        private void inputArea_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Display.Text += '1';
        }
        private void button2_Click(object sender, EventArgs e)
        {
            Display.Text += '2';
        }
        private void button3_Click(object sender, EventArgs e)
        {
            Display.Text += '3';
        }
        private void button4_Click(object sender, EventArgs e)
        {
            Display.Text += '4';
        }
        private void button5_Click(object sender, EventArgs e)
        {
            Display.Text += '5';
        }
        private void button6_Click(object sender, EventArgs e)
        {
            Display.Text += '6';
        }
        private void button8_Click(object sender, EventArgs e)
        {
            Display.Text += '8';
        }
        private void button7_Click(object sender, EventArgs e)
        {
            Display.Text += '7';
        }
        private void button9_Click(object sender, EventArgs e)
        {
            Display.Text += '9';
        }

        private void button10_Click(object sender, EventArgs e)
        {
            Display.Text += '0';
        }

        private void button11_Click(object sender, EventArgs e)
        {
            Display.Text += '.';
        }

        private void button17_Click(object sender, EventArgs e)
        {
            sin = true;
        }

        private void button18_Click(object sender, EventArgs e)
        {
            cos = true;
        }

        private void button19_Click(object sender, EventArgs e)
        {
            tan = true;
        }

        private void button20_Click(object sender, EventArgs e)
        {
            cot = true;
        }

        private void button11_Click_2(object sender, EventArgs e)
        {
            if (Display.Text != null)
            {
                Display.Text = null;
            }
            currentValue = 0;
        }

        private void button25_Click(object sender, EventArgs e)
        {
            Display.Text = saveSum.ToString();
        }

        private void button13_Click(object sender, EventArgs e)
        {
            squareRoot = true;
        }

        private void button14_Click(object sender, EventArgs e)
        {
            cubeRoot = true;
        }

        private void button21_Click(object sender, EventArgs e)
        {
            Display.Text += "-";
        }

        private void button16_Click(object sender, EventArgs e)
        {

        }

        private void button12_Click(object sender, EventArgs e)
        {
            calculator.MakeOperation(ref currentValue, ref Display, ref cubeRoot, ref squareRoot, ref exponentiation, ref sin, ref cos, ref tan, ref cot, ref rad, ref exponentiationValue);
            Display.Text = currentValue.ToString();
        }

        private void button15_Click(object sender, EventArgs e)
        {
            exponentiationValue = Convert.ToDouble(Display.Text);
            Display.Text = "";
            exponentiation = true;
        }

        private void button16_Click_1(object sender, EventArgs e)
        {
            rad = true;
        }

        private void button22_Click(object sender, EventArgs e)
        {
            rad = false;
        }
    }
}
