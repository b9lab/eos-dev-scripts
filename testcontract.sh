echo "Create new survey"

cleos push action survey createsurvey '[ 1, "What is the meaning of life?"]' -p survey@active
cleos push action survey createsurvey '[ 2, "What was the question?"]' -p survey@active

echo "Check surveys"

cleos get table survey survey sur # account scope table

cleos push action survey answer '[ "user", 1, "42"]' -p user@active

cleos push action survey answer '[ "tester", 1, "43"]' -p tester@active

cleos get table survey 1 res # account scope table