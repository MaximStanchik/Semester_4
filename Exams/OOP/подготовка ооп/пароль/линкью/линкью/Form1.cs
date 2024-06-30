using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace линкью
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            string[] names = { "Anna", "Alex", "Bob", "Alice", "John", "Amy", "Michael" };

            //Найти элементы массива names, которые начинаются с буквы "А".
            var a = names.Where(name => name.StartsWith("A")).ToList();
            //Пропустить элементы массива names, которые начинаются с буквы "А".
            var b = names.SkipWhile(name => name.StartsWith("A")).ToList();
            //Получить длину каждого элемента массива names.
            var c = names.Select(Name => Name.Length).ToList();
            //Разбить каждый элемент массива names на массив символов.
            var d = names.Select(name => name.ToCharArray()).ToList();
            //Взять первые 2 элемента массива names.
            var e = names.Take(2).ToList();
            //Взять элементы массива names, пока их длина меньше 5.
            var f = names.Select(name => name.Length < 5).ToList();
            //Пропустить первые 2 элемента массива names.
            var g = names.Skip(2).ToList();
            //Соединить первый элемент массива names с элементами после первых трех.
            var h = names.First() + string.Join("", names.Skip(3));
            //Отсортировать элементы массива names по их длине.
            var i = names.OrderBy(name => name.Length).ToList();
            //Отсортировать элементы массива names по их длине, а затем в обратном порядке по значению в пределах одной длины.
            var k = names.OrderByDescending(name => name.Length < 5).ToList();
            //Создать последовательность из 15 чисел, начиная с 34.
            var l = Enumerable.Range(34, 15).ToList();
            //Создать последовательность, содержащую число 10, повторяющееся 5 раз.
            var m = Enumerable.Repeat(10, 5).ToList();
            //Использование точечной нотации
            var o = names
                .Where(name => name.StartsWith("A"))
                .OrderBy(name => name)
                .ToList();
            //Создать массив целых чисел.
            int[] nambers = Enumerable.Range(1, 10).ToArray();
            //Изменить элемент, в источнике данных
            var change = names.Select(name => name == "Alice" ? "Popa" : name).ToList();

        }
    }
}
