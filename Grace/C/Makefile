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
CC = clang
##### COMPILATION FLAG #####
CCFLAGS = -Wall -Wextra -Werror

##### OSTYPE #####
UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
	# mac
	CCFLAGS += -D DARWIN
else
	#Linux and others...
	CCFLAGS += -D LINUX
endif

##### SRCS #####
SRCS = $(addprefix $(SRCPATH)/, Grace.c)

OBJ = $(SRCS:$(SRCPATH)/%.c=$(OBJPATH)/%.o)


### RULES ###

all : mk_objdir $(NAME)


mk_objdir:
	@if [ ! -d $(OBJPATH) ]; then mkdir $(OBJPATH); fi


$(NAME) : $(OBJ)
	@echo "\n$(END)$(BLUE)# Making $(NAME) #$(END)$(GREY)"
	$(CC) -o $@ $(OBJ)
	@echo "\n$(END)$(GREEN)# $(NAME) is built #$(END)"


$(OBJPATH)/%.o : $(SRCPATH)/%.c
	$(CC) $(CCFLAGS) -c $< -o $@

### CLEAN ###
.PHONY : sanitize clean fclean re

clean :
	@echo "$(END)$(RED)# removing $(NAME) objects #$(END)$(GREY)"
	rm -rf $(OBJ)
	rm -f Grace_kid.c

fclean : clean
	@echo "$(END)$(RED)\n# removing $(NAME) #$(END)$(GREY)"
	rm -f $(NAME)

re : fclean all

