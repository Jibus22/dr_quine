NAME = Grace

##### SRC & OBJ PATH #####
SRCPATH = .
OBJPATH = $(SRCPATH)/obj

##### LIB #####
LIBS =

##### INCLUDE #####
PATH_INCLUDE = .
HEADERS = $(PATH_INCLUDE)/*.h
INC = $(addprefix -I , $(PATH_INCLUDE))


##### COMPILER #####
CC = nasm
LINK = clang
##### COMPILATION FLAG #####
CFLAGS = -felf64

##### SRCS #####
SRCS = $(addprefix $(SRCPATH)/, Grace.s)

OBJ = $(SRCS:$(SRCPATH)/%.s=$(OBJPATH)/%.o)


### RULES ###

all: mk_objdir $(NAME)


mk_objdir:
	@if [ ! -d $(OBJPATH) ]; then mkdir $(OBJPATH); fi


$(NAME): $(OBJ)
	$(LINK) -o $@ $(OBJ)


$(OBJPATH)/%.o: $(SRCPATH)/%.s
	$(CC) $(CFLAGS) $< -o $@

### CLEAN ###
.PHONY: sanitize clean fclean re

clean:
	rm -rf $(OBJ)
	rm -f Grace_kid.s

fclean: clean
	rm -f $(NAME)

re: fclean
	@$(MAKE)

