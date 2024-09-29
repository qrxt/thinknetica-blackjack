# Общее

lint:
	rubocop --config ./.rubocop.yml

lint-fix:
	rubocop --config ./.rubocop.yml --auto-correct-all

run:
	irb -r ./main.rb

test:
	ruby -Itest ./tests.rb
