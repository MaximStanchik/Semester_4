using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ListsFieldsButtons
{
    public partial class Form1 : Form
    {
        Random random = new Random();
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            int amountOfNumbers = random.Next(10, 21);

            double[] arrayOfNumbers = new double [amountOfNumbers];

            for (int i = 0; i < amountOfNumbers; i++)
            {
                arrayOfNumbers[i] = random.Next(100, 1001);
                listBox1.Items.Add(arrayOfNumbers[i]);
                listBox2.Items.Add(i);
            }

            double maxNumberInArray = 0;
            int indexOfMaxNumberInArray = 0;
            for (int i = 0; i < amountOfNumbers; i++)
            {
                if (arrayOfNumbers[i] > maxNumberInArray)
                {
                    maxNumberInArray = arrayOfNumbers[i];
                    indexOfMaxNumberInArray = i;
                }
            }

            textBox1.Text = maxNumberInArray.ToString();
            textBox2.Text = indexOfMaxNumberInArray.ToString();
        }
    }
}
