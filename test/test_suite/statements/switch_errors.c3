
enum Foo
{
    A, B
}

enum Bar
{
    B
}

func void test_other_enum()
{
    Foo f = A;
    switch (f)
    {
        case Foo.A:
            break;
        case B:
            break;
        case Bar.B: // #error: Cannot implicitly cast 'Bar' to 'Foo'
            break;
    }
}

func void test_check_nums()
{
    Foo f = A;
    switch (f)
    {
        case 2:
            break;
        case 0:
            break;
    }
}

func void test_scope(int i)
{
    switch (i)
    {
        case 1:
            int a = 0;
            break;
        case 2:
            test_scope(a + 1); // #error: Identifier 'a' could not be found
    }
}

func void test_duplicate_case(int i)
{
    switch (i)
    {
        case 1:
            break;
        case 2:
            break;
        case 1:     // #error: same case value appears
            break;
    }
}

func void test_duplicate_case2(Foo i)
{
    switch (i)
    {
        case A:
            break;
        case 2:
            break;
        case A:     // #error: same case value appears
            break;
    }
}

func void test_duplicate_case3(Foo i)
{
    switch (i)
    {
        case A:
            break;
        case 0:     // #error: same case value appears
            break;
    }
}

enum Baz
{
    A, B, C, D
}

func void test_missing_all_cases(Baz x)
{
    switch (x) // -error: 4 enumeration values not handled in switch: A, B, C, ...
    {
    }
}

func void test_missing_some_cases(Baz x)
{
    switch (x) // -error: 4 enumeration B, C and D not handled in switch
    {
        case A:
            break;
    }
}

func void test_missing_some_cases2(Baz x)
{
    switch (x) // -error: 4 enumeration B and D not handled in switch
    {
        case C:
        case A:
            break;
    }
}

func void test_missing_some_cases3(Baz x)
{
    switch (x) // -error: 4 enumeration B and D not handled in switch
    {
        case B:
        case C:
        case A:
            break;
    }
}

func void test_missing_no_cases(Baz x)
{
    switch (x)
    {
        default:
            break;
    }
}