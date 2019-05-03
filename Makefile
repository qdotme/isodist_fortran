SHELL = /bin/sh
.SUFFIXES: 
.SUFFIXES: .f .o

PGM = isodist

LOCDIR = ./
SRC = $(wildcard $(LOCDIR)*.f) $(wildcard $(LOCDIR)sample_data/*.f) $(wildcard $(LOCDIR)sample_input_files/*.f) 
OBJ = $(addsuffix .o, $(basename $(SRC)))
#OBJ += 
#JMT- FC = g77
FC = gfortran

#JMT- FFLAGS = -O3
FFLAGS = -O3 -ffixed-line-length-none -I.

$(PGM): $(OBJ) 
	$(FC) $(FFLAGS) $(OBJ) -o $(PGM)
		
$(OBJ): $(PGM).h

.f.o: $(FC) $(FFLAGS) %.f

install:
	cp isodist /usr/local/bin

clean:   
	-rm isodist
	-rm *.o */*.o


