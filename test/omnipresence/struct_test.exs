defmodule Omnipresence.StructTest do
  use ExUnit.Case, async: true

  defmodule Dog do
    defstruct [:name, :age]
  end

  describe "present?/1" do
    test "struct is present" do
      assert Omnipresence.present?(%Dog{name: "Frank", age: 2})
    end

    test "struct fields are nil" do
      assert Omnipresence.present?(%Dog{name: nil, age: nil})
    end
  end

  describe "blank?/1" do
    test "struct is present" do
      refute Omnipresence.blank?(%Dog{name: "Frank", age: 2})
    end

    test "struct fields are nil" do
      refute Omnipresence.blank?(%Dog{name: nil, age: nil})
    end
  end

  describe "presence/1" do
    test "struct is present" do
      dog = %Dog{name: "Frank", age: 2}
      assert Omnipresence.presence(dog) == dog
    end

    test "struct fields are nil" do
      dog = %Dog{name: nil, age: nil}
      assert Omnipresence.presence(dog) == dog
    end
  end
end
