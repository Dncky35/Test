#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo -e "\nEnter your username:"
read USERNAME

GET_USER_RESULT=$($PSQL "SELECT username FROM users WHERE username='$USERNAME';")
if [[ -z  $GET_USER_RESULT ]]
then
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games LEFT JOIN users USING(user_id) WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games LEFT JOIN users USING(user_id) WHERE username='$USERNAME'")
  GAMES_PLAYED=$(echo "$GAMES_PLAYED" | xargs)
  BEST_GAME=$(echo "$BEST_GAME" | xargs)

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  
  USER_ID=$(echo "$USER_ID" | xargs)
fi

SECRET_NUMBER=$(( ( RANDOM % 1000 ) +1 ))
NUMBER_OF_GUESSES=0

echo -e "\nGuess the secret number between 1 and 1000:"
read GUESSED_NUMBER

until [[ $GUESSED_NUMBER == $SECRET_NUMBER ]]
do
  # update guess count
  ((NUMBER_OF_GUESSES++))
   # check guess is valid/an integer
  if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
    then
      # request valid guess
      echo -e "\nThat is not an integer, guess again:"
      read GUESSED_NUMBER
    # if its a valid guess
    else
      # check inequalities and give hint
      if [[ $GUESSED_NUMBER < $SECRET_NUMBER ]]
        then
          echo "It's higher than that, guess again:"
          read GUESSED_NUMBER
        else 
          echo "It's lower than that, guess again:"
          read GUESSED_NUMBER
      fi  
  fi
done

# update guess count
((NUMBER_OF_GUESSES++))

GET_USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
IFS='|' read -r USER_ID <<< "$GET_USER_ID"
USER_ID=$(echo "$USER_ID" | xargs)

INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES('$NUMBER_OF_GUESSES', '$USER_ID');")

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"


