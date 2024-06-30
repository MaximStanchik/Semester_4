using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace случайные_числа
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Random random = new Random();
            int col = random.Next(10, 21);
            
            List<int> nums = new List<int>();

            for (int i = 0; i < col; i++)
            {
                int num = random.Next(100, 1001);
                nums.Add(num);

                listBox1.Items.Add(num);
                listBox2.Items.Add(i);

                int maxnum = nums.Max();
                textBox1.Text = maxnum.ToString();
                int maxind = nums.IndexOf(maxnum);


                textBox2.Text = maxind.ToString();
            }
        }
    }
}
