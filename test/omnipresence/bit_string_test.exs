defmodule Omnipresence.BitStringTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "present?/1" do
    test "<<1::3>>" do
      assert Omnipresence.present?(<<1::3>>)
    end

    test "<<>>" do
      refute Omnipresence.present?(<<>>)
    end

    test "string filled with spaces" do
      refute Omnipresence.present?("    ")
    end

    test "empty string" do
      refute Omnipresence.present?("")
    end

    test "foobar" do
      assert Omnipresence.present?("  foobar  ")
    end

    property "given a string contains only whitespace" do
      check all(string <- whitespace()) do
        refute Omnipresence.present?(string)
      end
    end

    property "given string contains non whitespace" do
      check all(
              string <- non_whitespace(),
              leading <- whitespace(),
              trailing <- whitespace()
            ) do
        assert Omnipresence.present?(leading <> string <> trailing)
      end
    end
  end

  describe "blank?/1" do
    test "<<1::3>>" do
      refute Omnipresence.blank?(<<1::3>>)
    end

    test "<<>>" do
      assert Omnipresence.blank?(<<>>)
    end

    test "string filled with spaces" do
      assert Omnipresence.blank?("    ")
    end

    test "empty string" do
      assert Omnipresence.blank?("")
    end

    test "foobar" do
      refute Omnipresence.blank?("  foobar  ")
    end

    property "given a string contains only whitespace" do
      check all(string <- whitespace()) do
        assert Omnipresence.blank?(string)
      end
    end

    property "given string contains non whitespace" do
      check all(
              string <- non_whitespace(),
              leading <- whitespace(),
              trailing <- whitespace()
            ) do
        refute Omnipresence.blank?(leading <> string <> trailing)
      end
    end
  end

  describe "presence/1" do
    test "<<1::3>>" do
      assert Omnipresence.presence(<<1::3>>) == <<1::3>>
    end

    test "<<>>" do
      assert Omnipresence.presence(<<>>) == nil
    end

    test "string filled with spaces" do
      assert Omnipresence.presence("    ") == nil
    end

    test "empty string" do
      assert Omnipresence.presence("") == nil
    end

    test "foobar" do
      assert Omnipresence.presence("  foobar  ") == "foobar"
    end

    property "given a string contains only whitespace" do
      check all(string <- whitespace()) do
        assert Omnipresence.presence(string) == nil
      end
    end

    property "given string contains non whitespace" do
      check all(
              string <- non_whitespace(),
              leading <- whitespace(),
              trailing <- whitespace()
            ) do
        assert Omnipresence.presence(leading <> string <> trailing) == string
      end
    end
  end

  def whitespace_char do
    [<<194, 133>>, " ", "\t", "\n", "\v", "\f", "\r"]
  end

  defp whitespace do
    gen all(chars <- list_of(member_of(whitespace_char()), min_length: 1)) do
      Enum.join(chars)
    end
  end

  defp non_whitespace do
    string(:alphanumeric, min_length: 1)
  end
end
