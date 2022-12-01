defmodule Omnipresence.FloatTest do
  use ExUnit.Case, async: true

  describe "present?/1" do
    test "0.0" do
      assert Omnipresence.present?(0.0)
    end

    test "1.2" do
      assert Omnipresence.present?(1.2)
    end
  end

  describe "blank?/1" do
    test "0.0" do
      refute Omnipresence.blank?(0.0)
    end

    test "1.2" do
      refute Omnipresence.blank?(1.2)
    end
  end

  describe "presence/1" do
    test "0.0" do
      assert Omnipresence.presence(0.0) == 0.0
    end

    test "1.2" do
      assert Omnipresence.presence(1.2) == 1.2
    end
  end
end
