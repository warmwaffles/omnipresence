defmodule Omnipresence.BitStringTest do
  use ExUnit.Case, async: true

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
  end
end
