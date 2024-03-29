defmodule Omnipresence.CharlistTest do
  use ExUnit.Case, async: true

  # This may seem weird but, charlists are essentially lists of integers.
  # And technically it's present because `32` is the integer for a space and
  # if someone is using the presence check on a list of integers, we can
  # not strip out `32`s.

  describe "present?/1" do
    test "''" do
      refute Omnipresence.present?(~c"")
    end

    test "' '" do
      assert Omnipresence.present?(~c" ")
    end

    test "'  '" do
      assert Omnipresence.present?(~c"  ")
    end

    test "'a'" do
      assert Omnipresence.present?(~c"a")
    end
  end

  describe "blank?/1" do
    test "''" do
      assert Omnipresence.blank?(~c"")
    end

    test "' '" do
      refute Omnipresence.blank?(~c" ")
    end

    test "'  '" do
      refute Omnipresence.blank?(~c"  ")
    end

    test "'a'" do
      refute Omnipresence.blank?(~c"a")
    end
  end

  describe "presence/1" do
    test "' '" do
      assert Omnipresence.presence(~c" ") == ~c" "
    end

    test "'  '" do
      assert Omnipresence.presence(~c"  ") == ~c"  "
    end

    test "'a'" do
      assert Omnipresence.presence(~c"a") == ~c"a"
    end
  end
end
