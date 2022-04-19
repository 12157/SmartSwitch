PROJECT=Smart_Switch
SRC= src/smartswitch.cc\
src/main.cc\

TEST_SRC = test/main_test.cc\
src/main.cc\

INC = -I inc

build:
	g++ $(SRC) $(INC) -o $(PROJECT).out

run:
	./$(PROJECT).out
test:
	g++ $(TEST_SRC) -o $(PROJECT).out -lgtest -lgtest_main -lpthread

run_test: 
	./$(PROJECT).out 

clean:
	rm -rf *.out *.o *.gcda *.gcno *.gcov

analyse:
	cppcheck --enable=all $(SRC)

coverage:
	g++ -fprofile-arcs -ftest-coverage $(SRC) -o $(PROJECT).out -lgtest -lgtest_main -lpthread
	./$(PROJECT).out 
	gcov -a $(SRC)
