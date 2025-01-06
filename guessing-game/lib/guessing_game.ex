defmodule GuessingGame do
  def compare(secret_number, guess)
    when
      secret_number == guess
    do
    "Correct"
  end

  def compare(secret_number, guess)
    when
      abs(guess - secret_number) == 1
    do
    "So close"
  end

  def compare(secret_number, guess)
    when
      (guess - secret_number) > 1
    do
    "Too high"
  end

  def compare(secret_number, guess)
    when
      (guess - secret_number) < 1
    do
    "Too low"
  end

  def compare(_, guess \\ :no_guess)
    when
      guess == :no_guess
    do
    "Make a guess"
  end
end
