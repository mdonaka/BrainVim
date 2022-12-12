use std::env;
use std::fs;

fn cor_array(code: &String) -> Vec<usize> {
    let size = code.len();
    let mut array = vec![0; size];

    let mut index = 0;
    let mut stack = vec![0; 0];
    while index < size {
        let c = code.chars().nth(index).unwrap();
        match c {
            '[' => {
                stack.push(index);
            }
            ']' => {
                let bef = stack.pop().unwrap();
                array[bef] = index;
                array[index] = bef;
            }
            _ => {}
        }
        index += 1;
    }
    return array;
}

fn main() {
    let memory_size = 30000;

    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        panic!( "[ERROR] Missing command line arguments.\nUsage: cargo run [brainfuck code] [input file];");
    }
    let code = fs::read_to_string(args.get(1).unwrap()).unwrap();
    let input = fs::read_to_string(args.get(2).unwrap()).unwrap();

    let size = code.len();

    let mut trans = String::new();
    let mut code_index = 0;
    let mut input_index = 0;

    let mut pointer = 0;
    let mut array = vec![0; memory_size];

    let cor = cor_array(&code);
    let mut limit = 3000000;

    while code_index < size {
        let c = code.chars().nth(code_index).unwrap();

        match c {
            '>' => pointer += 1,
            '<' => pointer -= 1,
            '+' => array[pointer] += 1,
            '-' => array[pointer] -= 1,
            '.' => {}
            ',' => {
                let x = input.chars().nth(input_index).unwrap();
                array[pointer] = x.to_digit(10).unwrap();
                input_index += 1;
            }
            '[' if array[pointer] == 0 => code_index = cor[code_index] - 1,
            ']' if array[pointer] != 0 => code_index = cor[code_index] - 1,
            _ => {}
        }
        if c != '[' && c != ']' && c != '\n' {
            trans.push(c);
        }
        code_index += 1;

        limit -= 1;
        if limit < 0 {
            panic!("ERROR! reach limit size");
        }
    }
    println!("{}", trans);
}
