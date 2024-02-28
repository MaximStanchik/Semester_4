using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LBR_01
{
    interface IPerformingAnOperation
    {
        void MakeOperation(ref double currentValue, ref TextBox Display,  ref bool cubeRoot, ref bool squareRoot, ref bool exponentiation, ref bool sin, ref bool cos, ref bool tan, ref bool cot, ref bool rad, ref double exponentiationValue);
    }
    public class TPCalculatorForReals : IPerformingAnOperation
    {
        public void MakeOperation(ref double currentValue, ref TextBox Display, ref bool cubeRoot, ref bool squareRoot, ref bool exponentiation, ref bool sin, ref bool cos, ref bool tan, ref bool cot, ref bool rad, ref double exponentiationValue)
        {
            if (Display.Text == "")
            {
                throw new Exception(" Ничего не введено!");
            }

            if (currentValue == 0)
            {
                currentValue += Convert.ToInt32(Display.Text);
            }
            else
            {
                if (rad == false)
                {
                    double input = Convert.ToDouble(Display.Text);
                    double degrees = input * Math.PI / 180.0;

                    if (sin == true)
                    {
                        currentValue = Math.Sin(degrees);
                        sin = false;
                    }
                    else if (cos == true)
                    {
                        currentValue = Math.Cos(degrees);
                        cos = false;
                    }
                    else if (tan == true)
                    {
                        currentValue = Math.Tan(degrees);
                        tan = false;
                    }
                    else if (cot == true)
                    {
                        currentValue = 1 / Math.Tan(degrees);
                        cot = false;
                    }
                    else if (squareRoot == true)
                    {
                        currentValue = Math.Sqrt(input);
                        squareRoot = false;
                    }
                    else if (cubeRoot == true)
                    {
                        currentValue = Math.Pow(input, 1.0 / 3.0);
                        cubeRoot = false;
                    }
                    else if (exponentiation == true)
                    {
                        double exponent = Convert.ToDouble(Display.Text);
                        currentValue = Math.Pow(exponentiationValue, exponent);
                        exponentiationValue = currentValue;
                        exponentiation = false;
                    }
                } 
                else
                {
                    if (sin == true)
                    {
                        currentValue = Math.Sin(Convert.ToDouble(Display.Text));
                        sin = false;
                    }

                    if (cos == true)
                    {
                        currentValue = Math.Cos(Convert.ToDouble(Display.Text));
                        cos = false;
                    }

                    if (tan == true)
                    {
                        currentValue = Math.Tan(Convert.ToDouble(Display.Text));
                        tan = false;
                    }

                    if (cot == true)
                    {
                        currentValue = 1 / Math.Tan(Convert.ToDouble(Display.Text));
                        cot = false;
                    }

                    if (squareRoot == true)
                    {
                        currentValue = Math.Sqrt(Convert.ToDouble(Display.Text));
                        squareRoot = false;
                    }

                    if (cubeRoot == true)
                    {
                        currentValue = Math.Pow(Convert.ToDouble(Display.Text), 1.0 / 3.0);
                        cubeRoot = false;
                    }

                    if (exponentiation == true)
                    {
                        double exponent = Convert.ToDouble(Display.Text);  
                        currentValue = Math.Pow(exponentiationValue, exponent);
                        exponentiationValue = currentValue;  
                        exponentiation = false;
                    }
                }
            }
            Display.Text = null;
        }
    }
}
